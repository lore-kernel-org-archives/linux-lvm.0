Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104200547.f3K5l9Kp017136@webber.adilger.int>
Subject: Re: [linux-lvm] Kernel 2.4  -- invalid i/o protocol version
In-Reply-To: <01041918224302.03328@pc-silva> "from Ernesto Silva at Apr 19, 2001
 06:12:43 pm"
Date: Thu, 19 Apr 2001 23:47:09 -0600 (MDT)
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ernesto Silva writes:
> 	I've recently installed  a new server, runing RedHat 7.0. I have also
> installed 2.4 kernel with LM support.
> 
> 	Then I  have downloaded lvm-0.8final from the sistina ftp site, then
> I compiled it (I also included the patch) and I installed it. (well, no
> eveything was so smoothly, but it's installed now).

You need to have 0.9 version tools to run with the 2.4 kernel.

> I only have one scsi disk of 18GB, but I will add at least another 2 in the
> next month, so I need it working. Do you think this will work?? I'm almost
> betting my job on it.

Never good to bet your job on things you have not tested.  That way
leads to a new job.  LVM has been _fairly_ reliable, but there have
also been some problems as well - most have been fixable with a bit of
debugging, but...  It is always worthwhile to do testing before putting
a system into production.  Note that you have a far smaller chance of
having serious problems if you ensure you make backups of your data,
and make as few changes to your LVM configuration as possible.

I have never had problems with LVM that I didn't cause myself from
working on the code.  But then again, none of the data I have under
LVM is critical (mostly MP3s and test filesystems), and I have full
backups of everything.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
