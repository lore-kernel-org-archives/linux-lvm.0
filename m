Date: Thu, 13 Jul 2000 09:43:44 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: [linux-lvm] LVM ready for primetime?
Message-ID: <20000713094344.M3489@gospelcom.net>
Mime-Version: 1.0
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

I am looking to set up a ``poor-mans'' NetApp for our company. Basically,
here's what I'm looking at:

* Hardware RAID 1+0 (Mylex or something)
* ~150-300GB storage (all 18GB and 36GB SCSI disks)
* Logical Volume Manager (LVM)
* ReiserFS
* NFS or Coda
* Redhat Linux

Here are some of the applications we'd like to use this for:

* Web pages
* qmail Maildirs
* RealMedia files
* Possibly some MySQL/Sybase databases
* Approx. 20-50 full-time client machines

My question is this: is LVM ready for prime-time? The setup above seems like
a good idea in comparison with a NetApp (though I don't expect to get near
the same performance), but if it doesn't work, the comparison is moot.

Anyone have any thoughts on this? (Also, I welcome your recommendations for
changes to the hw/sw I've laid out above. However, it might be prudent to
e-mail these comments directly, and not the list.)

Thanks!

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
At first I thought, if I were Superman, a perfect secret identity would be 
'Clark Kent, Dentist,' because you could save money on tooth X-rays. But then 
I thought, if a patient said: How's my back tooth? and you just looked at it 
with your X-ray vision and said: Oh it's okay, then the patient would probably 
say: Aren't you going to take an X-ray, stupid? and you'd say: Aw &*$# you, 
get outta here, and then he probably wouldn't even pay his bill.
 (Jack Handey)
