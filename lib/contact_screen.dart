import 'package:assignment_contact_list_module14/contact_details.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ContactScreenState();
  }

}

class _ContactScreenState extends State<ContactScreen>{

  final TextEditingController _nameTEController = TextEditingController();
  final TextEditingController _numberTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //late final ContactDetails contact;
  final List<ContactDetails> _contactList = [];


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text('Contact List'),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
              gradient: LinearGradient(colors: [Colors.grey,Colors.blueGrey],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              ),),
          ),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child:  Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _nameTEController,
                      keyboardType: TextInputType.text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        labelText: 'Name',
                      ),
                      validator: (String ? value){
                        if(value == null || value.trim().isEmpty){
                          return 'Write your name';
                        }
                        return null;
                      },

                    ),
                    const SizedBox(height: 20,),

                    TextFormField(
                      controller: _numberTEController,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 11,
                      decoration: const InputDecoration(
                        hintText: 'Number',
                        labelText: 'Number',
                      ),
                      validator: (String ? value){
                        if(value ==null || value.trim().isEmpty){
                          return 'Write your number';
                        }
                        return null;

                      },
                    ),
                    const SizedBox(height: 10,),
                    ElevatedButton(onPressed: (){

                      if(_formKey.currentState!.validate()){
                        //Navigator.pop(context);
                        _addContact();
                      }

                    }, child: const Text('Add')
                    ),
                    const SizedBox(height: 20,),

                    _contactList.isEmpty
                        ? const Center(child: Text('No contacts yet',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),))
                        : ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: _contactList.length,
                      itemBuilder: (context,index){
                        return Container(
                          color: Colors.grey.withOpacity(0.1),
                          child:ListTile(
                            leading: const Icon(Icons.person,size: 35,),
                            title: Text(_contactList[index].name,style: const TextStyle(color: Colors.red,fontWeight: FontWeight.bold
                            ),),
                            subtitle: Text(_contactList[index].number),
                            onLongPress: (){
                              _showDeleteConfirmationDialog(index);
                            },
                            trailing: const Icon(Icons.phone,color: Colors.blue,size: 27,),
                          ),);
                      }, separatorBuilder: (BuildContext context, int index) {
                      return const Divider(height: 7,);
                    },
                    )
                  ],
                ),)
          ),
        )
    );
  }


  @override
  void dispose(){
    super.dispose();
    _nameTEController.dispose();
    _numberTEController.dispose();


  }

  void _addContact(){

    final String name = _nameTEController.text.trim();
    final String number = _numberTEController.text.trim();

    if(name.isNotEmpty && number.isNotEmpty){
      setState(() {
        _contactList.add(ContactDetails(name: name, number: number));
      });
    }

    _nameTEController.clear();
    _numberTEController.clear();


  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return Padding(padding: const EdgeInsets.all(16.00),
            child:  AlertDialog(
              elevation: 5,
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)
              ),
              // backgroundColor: Colors.white,
              title: const Text('Confirmation',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              content: const Text('Are you sure for Delete?',style: TextStyle(fontSize: 20),),
              actions: [

                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.no_sim_outlined)),

                IconButton(onPressed: (){

                  _deleteContact(index);
                  Navigator.pop(context);

                }, icon: const Icon(Icons.delete_outline)),
              ],
            ),
          );

        }
    );
  }

  void _deleteContact(int index){

    setState(() {
      _contactList.removeAt(index);
    });


  }
}