Message-ID: <B51F0C636E578A4E832D3958690CD73E0130BFFB@es04snlnt>
From: "Diehl, Jeffrey" <jdiehl@sandia.gov>
Subject: RE: [linux-lvm] My VG is gone...
Date: Wed, 5 Sep 2001 12:56:10 -0600
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: 'Rasmus Wiman ' <rasmus.wiman@sami.se>, "'linux-lvm@sistina.com '" <linux-lvm@sistina.com>

I will be formating 311Gb of hard drives today.  These drives were 40% full.
This is the second time that LVM has bitten me.  The first time I tried to
expand a VG, the VG was gone when the machine rebooted.  Same thing this
time.  AND THERE IS APEARANTLY NO WAY TO RECOVER!  It seems that all of the
vg data is recorded in each member pv.  So, why isn't there a utility to
recover a vg in this situation?  This is very fragile! 

Mike Diehl.


-----Original Message-----
From: Rasmus Wiman
To: linux-lvm@sistina.com
Sent: 9/5/2001 2:04 AM
Subject: Re: [linux-lvm] My VG is gone...

"Diehl, Jeffrey" <jdiehl@sandia.gov> skrev:

> Any ideas about how to recover without losing my data.  I need to get
> going
> soon, so if I haven't fixed it by late this week, I'm going to
> reformat....
> And lose several Gb of data.

I have already reformated my hard disks, alas. I didn't have time to
wait
for a solution. But If someone would have helped me or suppllied code
that
fixed the problem, it could have beed the start of a Doctor LVM project.
I
think there should really be crash recover tools for any file system and
LVM system since they all do crash some times.


---------------------
Rasmus Wiman
SAMI Labs

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
