Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBB1oSCC004560
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2014 20:50:28 -0500
Received: from smtprelay.hostedemail.com (smtprelay0242.hostedemail.com
	[216.40.44.242])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBB1oQh2016505
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2014 20:50:26 -0500
References: <5480E939.3070702@ubuntu.com>
	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
	<5484C5A7.8080601@ubuntu.com>
	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
	<op.xqkhx9gjae9kta@comodus> <5488F019.80805@ubuntu.com>
Date: Wed, 10 Dec 2014 19:50:10 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Jason Warr" <jason@warr.net>
Message-ID: <op.xqokpwo4ae9kta@comodus>
In-Reply-To: <5488F019.80805@ubuntu.com>
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>, Anatoly
	Pugachev <matorola@gmail.com>, Phillip Susi <psusi@ubuntu.com>

On Wed, 10 Dec 2014 19:15:05 -0600, Phillip Susi <psusi@ubuntu.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA512
>
> On 12/08/2014 03:59 PM, Jason Warr wrote:
>> I may have missed part of the discussion but in order to fully
>> understand what is going on I'd like to know what arguments you
>> used when you issued the "lvconvert --splitmirrors" command.  There
>> are several options to it that can influence what happens to the
>> mirror members.
>
> The exact sequence of commands was:
>
> lvconvert --type raid1 -m 1 faldara/utopic /dev/sdb1
> lvconvert --splitmirrors 1 --trackchanges faldara/utopic --name
> utopic-backup /dev/md0

It ignores the name because what it does with "--trackchanges" is rename  
the mirror leg to a visible & read only version of the meta.  Sample:

[5:root@goldmember /etc/sysconfig/network-scripts]# lvs -a -o  
lv_name,lv_attr,lv_dm_path,devices,copy_per
   LV                  Attr       DMPath                                  
Devices
   test01LV            rwi-aor--- /dev/mapper/test01VG-test01LV           
test01LV_rimage_0(0),test01LV_rim
   [test01LV_rimage_0] Iwi-aor--- /dev/mapper/test01VG-test01LV_rimage_0  
/dev/sdas(12802)
   [test01LV_rimage_1] Iwi-aor--- /dev/mapper/test01VG-test01LV_rimage_1  
/dev/sdar(12802)
   [test01LV_rmeta_0]  ewi-aor--- /dev/mapper/test01VG-test01LV_rmeta_0   
/dev/sdau(0)
   [test01LV_rmeta_1]  ewi-aor--- /dev/mapper/test01VG-test01LV_rmeta_1   
/dev/sdat(0)

Would be like so after:

[5:root@goldmember /etc/sysconfig/network-scripts]# lvs -a -o  
lv_name,lv_attr,lv_dm_path,devices,copy_per
   LV                  Attr       DMPath                                  
Devices
   test01LV            rwi-aor--- /dev/mapper/test01VG-test01LV           
test01LV_rimage_0(0),test01LV_rim
   test01LV_rimage_0   Iri-a-r--- /dev/mapper/test01VG-test01LV_rimage_0  
/dev/sdar(1)
   [test01LV_rimage_1] iwi-aor--- /dev/mapper/test01VG-test01LV_rimage_1  
/dev/sdas(12802)
   [test01LV_rmeta_0]  ewi-a-r--- /dev/mapper/test01VG-test01LV_rmeta_0   
/dev/sdar(0)
   [test01LV_rmeta_1]  ewi-aor--- /dev/mapper/test01VG-test01LV_rmeta_1   
/dev/sdas(12801)



> lvconvert --splitmirrors 1 --trackchanges faldara/utopic --name
> utopic-backup /dev/md0
>
> The idea was to start using the new drive exclusively while keeping a
> backup on the old drive.
>
> Also I thought it was a bit odd that --splitmirrors accepted the
> - --name argument, but silently ignored it, instead using an internal
> auto generated name.
>

You can't track changes and rename the "backup" leg at the same time.  If  
you wanted to keep the backup leg after making sure the in use one was  
good you would need to issue a new "--splitmirror"
  command with a new volume name and *no* "--trackchanges" option.

>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1
>
> iQEcBAEBCgAGBQJUiPAZAAoJENRVrw2cjl5RAS0H/10hFYNUF8n71iXER0iQVAtd
> bHauiQBbemml3Q1RgqWHCFj2SYQB0epACFHIdyDUC2kWaNyQ7A9VnbRPsnyEGLzo
> Tu2+LjbH2QA1e8J9zHQYq8BO0jHay5n/1S/JZrhUHxW0hyI3vnsVXESNA4GUntqn
> tcC7N+wzu8SUIuqjtcm30kEE0ZvzlDv4znADIudJzXJu7JE+TjhIljg5YWY8NBxE
> AYbUc1f8tGKzIyzehPETpq6/Hsi4C8C27nw+kugs+HvrmWO29nqhjQczXlbYfvjL
> SDNsXLMj68dkjSqJzuuK0jy6HlHgrPxJJtaGfJ92TIcFbm9gVJHWfqClzbd1vao=
> =am39
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
