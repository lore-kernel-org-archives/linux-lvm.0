From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] cannot create a volume group named the same as one already removed
Message-ID: <20030206194742.I11767@zealot.blacknet.de>
References: <3E4295C1.9010802@motorola.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E4295C1.9010802@motorola.com>; from tom.georgoulias@motorola.com on Thu, Feb 06, 2003 at 11:05:05AM -0600
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
Date: Thu Feb  6 12:48:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 06 '03 at 11:05, Tom Georgoulias wrote:
> [root@mom root]# vgcreate volgrp2 /dev/hdg
> vgcreate -- volume group directory or file already exists
                     ^^^^^^^^^^^^^^^         ^^^^^^^^^^^^^^
> vgcreate -- please choose a different name

if you are sure the group does not exist any more:

[root@mom root] # vgscan
[root@mom root] $ rm -rf /dev/volgrp2

-- 
Goetz Bock       (c) 2003 as     blacknet.de - Munich - Germany   /"\
IT Consultant    GNU FDL 1.1    secure mobile Linux everNETting   \ /
                                                                   X
 ASCII Ribbon Campaign against HTML email & microsoft attachments / \
