Message-ID: <3B92827B.30809@st-peter.stw.uni-erlangen.de>
Date: Sun, 02 Sep 2001 21:03:23 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] My VG is gone...
References: <20010831071518.07f51602.rasmus.wiman@sami.se>	<20010831102206.A391@btconnect.com> <20010902200715.73773199.rasmus.wiman@sami.se>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi could you post one more time the
output from pvdata -U -V -PP and vgdisplay -d

maybe inline and not as attachments because my Mozilla treats the 
attachment as plain text the same is with konqueror
i see only smth of the kind :

---------------------
Rasmus Wiman
SAMI Labs

--Multipart_Fri__31_Aug_2001_09:41:46_+0200_08e497f0
Content-Type: application/octet-stream;
 name="vgdisplay.txt"
Content-Disposition: attachment;
 filename="vgdisplay.txt"
Content-Transfer-Encoding: base64

PDE+IGx2bV9jaGVja19rZXJuZWxfbHZtdGFiX2NvbnNpc3RlbmN5IC0tIENBTExFRAo8MjI+IHZn
X2NoZWNrX2FjdGl2ZV9hbGxfdmcgLS0gQ0FMTEVECjwzMzM+IHZnX3N0YXR1c19nZXRfY291bnQg
LS0gQ0FMTEVECjwzMzM+IHZnX3N0YXR1c19nZXRfY291bnQgLS0gTEVBVklORyB3aXRoIHJldDog
MAo8MjI+IHZnX2NoZWNrX2FjdGl2ZV9hbGxfdmcgLS0gTEVBVklORyB3aXRoIHJldDogLTMzMSAg
cHRyOiAobnVsbCkKPDIyPiBsdm1fdGFiX3ZnX2NoZWNrX2V4aXN0X2FsbF92ZyAtLSBDQUxMRUQK
PDMzMz4gbHZtX3RhYl9yZWFkIC0tIENBTExFRAo8MzMzPiBsdm1fdGFiX3JlYWQgLS0gTEVBVklO
RyB3aXRoIHJldDogMCAgZGF0YTogODA0QjU4OCAgc2l6ZTogMQo8MjI+IGx2bV90YWJfdmdfY2hl
Y2tfZXhpc3RfYWxsX3ZnIC0tIExFQVZJTkcgd2l0aCByZXQ6IDAKPDE+IGx2bV9jaGVja19rZXJu
ZWxfbHZtdGFiX2NvbnNpc3RlbmN5IC0tIExFQVZJTkcgd2l0aCByZXQ6IDEKPDE+IGx2bV9nZXRf
aW9wX3ZlcnNpb24gLS0gQ0FMTEVECjwyMj4gbHZtX2NoZWNrX3NwZWNpYWwgLS0gQ0FMTEVECjwy
Mj4gbHZtX2NoZWNrX3NwZWNpYWwgLS0gTEVBVklORwo8MT4gbHZtX2dldF9pb3BfdmVyc2lvbiAt



Rasmus Wiman wrote:

>Joe Thornber <thornber@btconnect.com> skrev:
>
>>>This evening I added a 36 GB drive to our department server. I did a
>>>vgextend on it and somehow it all went terribly wrong. It seems to me
>>>
>>that
>>
>>>the new drive got added twice, but with different UUIDs. Of course
>>>
>>there
>>
>>>is no way vgchange will bring it online. Is there a solution to the
>>>problem? I downloaded LDE from <http://lde.sourceforge.net/> to have a
>>>look at it, but I don't know what to alter. I run Slackware 8 with
>>>
>>Kernel
>>
>>>2.4.8 and LVM-1.0. The attached files contain output from pvdata -U -V
>>>
>>-PP
>>
>>>on all three partitions.
>>>
>>You're right sdb1 appears to have been added twice with seperate
>>UUID's.  I'm at a loss to explain this at the moment.  Did you run
>>pvcreate more than once on sdb1 ? (I want to know where that extra
>>uuid came from).
>>
>
>Well here's the full story:
>I added the new disk, made a new LVM partition, ran pvcreate on it. Did a
>vgextend vg1 /dev/sdb1. Rebooted. No vg:s found, Panic: root not found.
>Spent a bunch of hours hackaing a Slackware 8 boot floppy with LVM 1.0
>support. It found the vg. Next idea: Maybe it's because of devfs. I hacked
>the disk a bit further yo use devfs, and now it didn't find the VG:s. I
>started looking for any LVM list archive, found something about small
>initrd:s so I put an 8 MB initrd image on the root floppy, and wow, the VG
>was there. Tried to put a larger initrd on the boot partition and re-ran
>lilo. Rebooted, no success. Later I realised that a initrd_size=8912k
>might have done the trick. Booted from the floppy again and did a vgreduce
>vg1 /dev/sdb1. Now it would boot. Here I should really have backed up
>everything to a non LVM partition, but instead I did a vgextend vg1 sdb1.
>Re-ran lvmcreate_initrd, re-ran lilo and rebooted. That's where I am now.
>Two SDB1:s with separate UUID's. Can this be fixed or should I format and
>reinstall? It would really feel bad because I've never had to format and
>reinstall a Linux system except for the occasional hardware failure.
>
>
>---------------------
>Rasmus Wiman
>SAMI Labs
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
