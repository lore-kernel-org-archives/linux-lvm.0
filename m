From: Denie Andriessen <D.Andriessen@pink.nl>
Subject: Re: [linux-lvm] running lvm tool from user application script
Message-Id: <003f01c1dc83$1bdc1840$f707a182@gimmie.tudelft.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <00bf01c1dc5a$43e78be0$6501a8c0@bomoon>
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
Date: Fri Apr  5 03:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

Well, I don't really think that's an issue having to do anything with LVM.
It's something to do with 'security'.  On most systems 'plain' users hVe
quite modest rights in the etc directory, and for quite good reasons. You
get that because the mode of /etc/lvmtab doesn't allow you to write to it,
as forinstance vgscan would like to do..

letting a user run those programs sounds like a pretty bad idea, but if you
still want to go ahead, there's at least 2 ways around it, 1) allow the
webuser to sudo that command (see sodu/sudoers), or just get a cron job on
root, that runs those commands, and dumps the output in a place where your
CGI thingy can read it..

Denie



----- Original Message -----
From: bo
To: linux-lvm@sistina.com
Sent: Friday, April 05, 2002 6:27 AM
Subject: [linux-lvm] running lvm tool from user application script


LVM gurus,

I have been playing with the LVM tool for a while under ROOT privilledge.
Today, I tried to run "lvscan" & "pvscan" from one of my user script
to show LVM status to user. I realized I could not run them having the
attached errors.

Q1: Is that true I can not run "vgscan", "lvscan",... under user applciation
which does not have "root" right?

Q2: I want to run these utilities from my CGI script for Web GUI.
     Any suggestions?

Thanks in advance,

BM

ATTACH)-------------------------------------------------------------------
Error2)
mooasun>$cat /etc/*tab
mooasun>$anacrontab    fstab    lvmtab    raidtab
mooasun>$crontab        inittab    mtab
mooasun>$lvscan
mooasun>$lvscan -- ERROR: "/etc/lvmtab" doesnot exist; please run vgscan

Error1)
mooasun>$vgscan
mooasun>$vgscan -- LVM driver/module not loaded!
