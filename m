From: "Anthony Luke Nelson" <tony.nelson@pobox.com>
Subject: RE: [linux-lvm] LVM available on software raid5 (md)
Message-Id: <000901c1b6fe$42c2dde0$0700000a@eagle7>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <ufaofiqhumy.fsf@epithumia.math.uh.edu>
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
Date: Sat Feb 16 09:26:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

OK, thanks.

I was messing with SUSE 7.3 and in their LVM control panel, it only
seemed to suport linear or striping. 
How have you done yours? Do yo do it from the command line and are any
specific versions/packages required for this?
Are you using the Sistina LVM package?

 
 
 
Thanks,

 
________________________________________________________________________
__________________
Anthony Luke Nelson
"nerd with an attitude"
tony.nelson@wcom.com
http://ret.wcomnet.com
Enterprise NOS Services Southeast
Worldcom
Bell 919-377-4881
vnet 966-4881

 
 
 
 


-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]
On Behalf Of Jason L Tibbitts III
Sent: Saturday, February 16, 2002 12:18 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM available on software raid5 (md)


>>>>> "ALN" == Anthony Luke Nelson <tony.nelson@pobox.com> writes:

ALN> Does anyone know if LVM is supported on software raid5.

Works fine for me:

md5 : active raid5 sdh7[1] sdg7[6] sdf7[5] sde7[4] sdd7[3] sdc7[2]
sdb7[7] sda7[0]
      416837376 blocks level 5, 128k chunk, algorithm 2 [7/7] [UUUUUUU]

VG:  nas  [1 PV, 11 LV/10 open]  PE Size: 8192 KB
  Usage [KB/PE]: 416825344 /50882 total  386924544 /47232 used  29900800
/3650 free
  PV:  [AA] md5                   416825344 /50882   386924544 /47232
29900800 /3650

 - J<

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO@http://www.sistina.com/lvm/Pages/howto.html
