# flutter_doppler

Use secrets stored in doppler in your Flutter app. 

Once you've added your secrets and installed the dopler cli, follow the steps below to run project locally:

1. Login using `doppler login`
2. Move to project directory and run `doppler setup`
3. Run the `script.sh` file. ie Execute `./script.sh` on project dir.

Note: 
- You can use your preferred device id on script file. eg `flutter run -d <deviceid>`
- Ensure you replace the config file with the correct secret name on your doppler account - in case you named them differently. 
