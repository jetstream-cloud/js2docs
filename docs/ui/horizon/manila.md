# To use Manila via Horizon

### 1. Create the share on Horizon

i. Click on:  Project  → Share → Shares → Create Share <br>

![image](/images/JS2-manila1.png)
&nbsp;

ii. Create a share with the following settings:

- share name - a name of your choosing
- share protocol - CephFS
- size - the size of your manila share
- share type - cephnfsnativetype

![image](/images/JS2-manila2.png)
&nbsp;

### 2. Edit the share rule

i. Once your share is available you can select `Manage Rules` and `Add Rule` :

![image](/images/JS2-manila3.png)  &nbsp;

- access type - cephx
- access level - read-write
- access to - an arbitrary unique name


In the example above the accessTo name is `manilashare`. The name assigned must be globally unique, if you use a name that is already in use you will see and error state.

![image](/images/JS2-manila4.png)  &nbsp;


ii.  If you now go back to the share page (Project/Share/Shares) and click on the share you created you should see your share's metadata.

Important things to note here are :

- Path - ips:ports followed by volume path (/volume/\_no-group/...)
- Access Key



![image](/images/JS2-manila5.png)  &nbsp;


### Using Manila Share on a VM

This is the same whether you're using Horizon or the CLI. Please refer to [Configuring a VM to use Manila Shares](../../general/manilaVM.md)
