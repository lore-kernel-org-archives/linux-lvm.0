Message-ID: <2D4B6CD74137D4119A1100104BC6BCBF0BC585CB@dubntex006.qwest.net>
From: "Montgomery, Kendal L" <kendal.montgomery@qwest.com>
Subject: RE: [linux-lvm] determining lv from mount point 
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
Date: Tue Sep 23 16:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Ahh.. Yes.. You're correct.  I finished my email before I completed my train
of thought.

You could store the result of the df line in a variable, and then do
something like this:

#!/bin/bash

if [[ ! -d ${1} ]]
then
  echo "error: ${1} is not a valid mount point"
  exit 1
fi

DEVICE=$(df ${1} | grep -v ^Filesystem | awk '{ print $1 }')

lvscan | grep ${DEVICE} > /dev/null 2>&1

if [[ ${?} -eq 0 ]]
then
  # do what you want to do if you detect that this is lvm
else
  # do somethine else
Fi


Try that out.

Kendal.

-----Original Message-----
From: Galen Seitz [mailto:galens@seitzassoc.com] 
Sent: Tuesday, September 23, 2003 4:37 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] determining lv from mount point 


Montgomery, Kendal L <kendal.montgomery@qwest.com> wrote:

> The df command will already do that.  For instance, on my machine, if 
> I do:
> 
> [klmontg@klmontg klmontg]$ df /opt
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/vg01/opt          4194172   1610880   2583292  39% /opt
> 
> It gives me the filesystem, etc.

Unfortunately, this doesn't help when trying to distinguish between regular
and lvm filesystems.  On my system, / and /boot are on regular partitions.

bash-2.05b$ df /boot
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1                99134     13828     80187  15% /boot
bash-2.05b$ df /usr
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/Volume00/LV_usr   4031680   2151280   1675600  57% /usr

I'd like to distinguish between these two without hardcoding knowledge of
device or volume names into my script.  One thing I have considered is doing
an ls -l on the device name and checking for the lvm major. Of course, then
I would have to hardcode the lvm major into my script. I just figured
someone must have a better way to do this.

thanks,
galen


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
