Return-Path: <root@lewis.abi.tconline.net>
From: Lewis Bergman <lbergman@abi.tconline.net>
Subject: Re: [linux-lvm] LVM on Redhat 7.1
Date: Fri, 17 Aug 2001 07:55:16 -0500
References: <200108171114.GAA15717@ns2.abi.tconline.net>
In-Reply-To: <200108171114.GAA15717@ns2.abi.tconline.net>
MIME-Version: 1.0
Message-Id: <0108170755160M.01966@lewis.abi.tconline.net>
Content-Transfer-Encoding: 8bit
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

> 	So how do i load this module and from where ?
This is not a real answer about modules, more of a preference thing. I don't 
use LVM in module form. Not because I don't like modules, but rather because 
I know that they would always be loaded in every case and all the time so 
there is no need to have them as a module. I compile both LVM and Reiserfs 
into the kernel so the module problems are not an issue.

I understand in somecases where you are compiling things like X, sound, and a 
bunch of other things ten this might result in a kernel that is to big to fit 
on a 3.5 even if you do a bzimage. I don't so my kernel fits well inside one 
even as it is monolithic.

Sorry for the "issue avoidance" but some things really do deserve to be in 
the kernel and IMHO LVM , RAID, and ReiserFS fit in this category.

-- 
Lewis Bergman
Texas Communications
4309 Maple St.
Abilene, TX 79602-8044
915-695-6962
