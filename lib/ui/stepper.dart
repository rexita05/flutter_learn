import 'package:flutter/material.dart';

class StepPage extends StatefulWidget {
  const StepPage({Key? key}) : super(key: key);

  @override
  _StepPageState createState() => _StepPageState();
}

class _StepPageState extends State<StepPage> {
  int _currentStep=0;
  bool isCompleted=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 40,
        // elevation: 0,
        backgroundColor: Colors.teal,
        titleSpacing: 0,
        title: const Text("Pengajuan KIA", style: TextStyle(fontSize: 20),),
      ),
      body: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(primary: Colors.teal)
          ),
          child: Container(
            child: Stepper(
              type: StepperType.horizontal,
              physics: AlwaysScrollableScrollPhysics(),
              currentStep: _currentStep,
              steps: _stepList(),
              controlsBuilder: (context, {onStepCancel, onStepContinue}) {
                final isLastStep = _currentStep == _stepList().length - 1;
                return Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      if(_currentStep != 0)
                      Expanded(
                        child: RaisedButton(
                          child: const Text('Kembali', style: TextStyle(fontSize: 16, color: Colors.black),),
                          onPressed: onStepCancel,
                        )
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: RaisedButton(
                          color: Colors.teal,
                          child: Text(isLastStep ? 'Kirim Data' : 'Selanjutnya', style: TextStyle(fontSize: 16, color: Colors.white),),
                          onPressed: onStepContinue,
                        )
                      )
                    ],
                  ),
                );
              },
              onStepTapped: (step){
                _currentStep = step;
                setState(() {});
              },
              onStepContinue: (){
                if(_currentStep <(_stepList().length-1)){
                  _currentStep +=1;
                }
                setState(() {});
              },
              onStepCancel: (){
                if(_currentStep == 0){
                  return;
                }
                _currentStep -=1;
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }

  List <Step> _stepList()=>[
    Step(
      state: _currentStep <=0 ? StepState.indexed : StepState.complete,
      isActive: _currentStep >= 0,
      title: Text('Lokasi'),
      content: Container(
          child: Text('Lokasi')
      )
    ),
    Step(
      state: _currentStep <=1 ? StepState.indexed : StepState.complete,
      isActive: _currentStep >= 1,
      title: Text('KIA'),
      content: Container(
          child: Text('Info KIA')
      )
    ),
    Step(
      state: _currentStep <=2 ? StepState.indexed : StepState.complete,
      isActive: _currentStep >= 2,
      title: Text('Berkas'),
      content: Center(
          child: Text('Berkas')
      )
    ),
    Step(
      state: _currentStep <=3 ? StepState.indexed : StepState.complete,
      isActive: _currentStep >= 3,
      title: Text('Syarat Ketentuan'),
      content: Center(
          child: Text('Syarat Ketentuan')
      )
    ),
  ];
}

