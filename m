From: lembark@wrkhors.com
Subject: Re: [linux-lvm] Removing a physical volume.
Message-Id: <5780000.1009576541@duke.wrkhors.com>
In-Reply-To: <04QKIFOKE0E9XSJIWRCAD0V3Y3UQ3Y.3c2ce3cf@kadzuki>
References: <04QKIFOKE0E9XSJIWRCAD0V3Y3UQ3Y.3c2ce3cf@kadzuki>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Dec 28 15:55:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Anders Widman <andewid@tnonline.net> on 12/28/01 22:27:43 +0100

> Hello everyone!
> 
> I tried to look in various help-files and FAQ's but did not find a suitable
> guide. I have a LVM system with a few disks, and everything works fine. Now I
> need to remove a physical disk (to put somewhere else, in another  machine).
> 
> 
> This is my current setup:
> 
> 14 physical disks in one logical volume (share) formated with reiserfs, in
> one volumegroup (server). There are no free physical extents, though there
> are about 150GB free space in the filesystem.
> 
> I want to remove one physical disk and have all data moved over to the
> remaining disks.

To shuffle space of of a PV create new LV's that don't use
the storage on it and copy the data from LV's that do use
the PV onto the new LV's. If you don't have sufficient 
storage then use an external device (e.g., tape) or a 
raw LV as a temp storage device.

--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
