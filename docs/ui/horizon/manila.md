# To use Manila via Horizon

### 1. Create the share on Horizon

---

![](/images/JS2-manila1.png){ align=right ; width=50% }

i. Click on:  `Project`  → `Share` → `Shares` → `+Create Share`

</br></br></br></br></br></br></br></br>

---

![](/images/JS2-manila2.png){ align=right ; width=50% }

ii. `Create share` with the following settings:

- **share name**: a name of your choosing
- **share protocol**: CephFS
- **size**: the size of your manila share
- **share type**: cephnfsnativetype

</br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br></br>

---

### 2. Edit the share rule

i. Once your share is available you can select `Edit Share` and `Manage Rules` and `Add Rule` :

![](/images/JS2-manila3.png){ align=right ; width=50% }

- **access type**: cephx
- **access level**: read-write
- **access to**: an arbitrary unique name

![](/images/JS2-manila4.png){ align=right ; width=50% }

In the example above the `accessTo` name is `manilashare`.</br>***The name assigned must be globally unique!*** If you use a name that is already in use you will see an error state. To help avoid accidental overlap, we recommend prefixing your name with something unique such as your ACCESS username or your allocation number. For example, instead of using just `seed-research`, use `<ALLOCATION>-seed-research`.

</br></br></br></br></br></br></br></br>

---

![](/images/JS2-manila5.png){ align=right ; width=50% }

ii.  If you now go back to the share page (`Project`/`Share`/`Shares`) and click on the share you created you should see your share's metadata.

Important things to note here are :

- **Path**: `IPs`:`ports` followed by volume path (/volume/\_no-group/...)
- **Access Key**


</br></br></br></br></br></br>

---




### Using Manila Share on a VM

This is the same whether you're using Horizon or the CLI. Please refer to [Configuring a VM to use Manila Shares](../../general/manilaVM.md)
