Return-Path: <gang123@hu.com.cn>
Date: Thu, 22 Feb 2001 13:55:30 -0800
From: hugang <gang123@hu.com.cn>
Subject: Re: [linux-lvm] lvm on a brand-new server
Message-Id: <20010222135530.09168730.gang123@hu.com.cn>
In-Reply-To: <Pine.GSO.4.21.0102211227040.17882-100000@isis.visi.com>
References: <Pine.GSO.4.21.0102211227040.17882-100000@isis.visi.com>
Mime-Version: 1.0
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
To: linux-lvm@sistina.com

On Wed, 21 Feb 2001 12:34:19 -0600 (CST)
Timothy Wilson <wilson@visi.com> wrote:
	I thinks your can do it in folowing :

	1: Use the hardware RAID controller to make mirror .

	2: <Install Linux .	>
		( Your will Can see ONE DISK , Create a partion in it ( < 800MB ),And install a linux in it )

	3: Install LVM and reiserfs patch and software.

	4: <MOVE system to LVM>
		Create  the other partition with LVM ,mkreiserfs ,copy all system to it .
	


>Hi everyone,
>
>I'm just starting out learning about lvm and I have a couple questions.
>
>First, a description of the machine:
>
>Compaq DL380 933 MHz PIII (rack-mount) w/ 640 MB RAM and (2) 18 GB SCSI
>disks. The machine has Compaq's built-in hardware RAID controller. My plan
>is to mirror the two disks using RAID.
>
>I'd like to use LVM (and likely ReiserFS) on this box, but I'm not sure how
>to get it installed on a bare system. I'll likely be using Debian on this
>system.
>
>Can anyone suggest a basic outline of the process? I'm certain there's a lot
>more reading to do, but I'm not sure where to start. (I have looked over the
>LVM How-to and the FAQ.)
>
>-Tim
>
>--
>Tim Wilson      | Visit Sibley online:         | Check out:
>Henry Sibley HS | http://www.isd197.k12.mn.us/ | http://www.zope.org/
>W. St. Paul, MN |                              | http://slashdot.org/
>wilson@visi.com |   <dtml-var pithy_quote>     | http://linux.com/
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm


-- 
--------------------------------------------------------------------
                       Hu  Gang 
--------------------------------------------------------------------
Email	: linuxbest@sina.com,linuxhappy@tang.com,gang_hu@soul.com.cn 
Comany  : China Beijing Soul
Phone   : +860168425741~~44
MP	: 13601394711
--------------------------------------------------------------------
Linux Reigstered User ID 	#204016
--------------------------------------------------------------------
