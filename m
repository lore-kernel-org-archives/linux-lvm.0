From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Does LVM have the same "Problems" like RAID 0
 (Stripping)?
Message-ID: <162800000.1033048230@[192.168.200.4]>
In-Reply-To: <NEBBKJBPDKAJIBGECBPDKEKADLAA.s.siefert@global-media.de>
References: <NEBBKJBPDKAJIBGECBPDKEKADLAA.s.siefert@global-media.de>
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
Date: Thu Sep 26 08:55:59 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Stefan Siefert <s.siefert@global-media.de>

> what happens if one of the physical devices of an LV gets damaged? Is the
> whole LV gone (like on a RAID 0 (Stripping)) or are only those data gone
> which where on the physical device?

If one of the PV's goes away then anything striped across
it is lost. If you require a high-uptime system then a
better approach is to use LVM on top of hardware RAID.

Mirroring the PV's gives higher uptime; RAID-5 or -S uses
less space at the expense of bad performance when a drive
goes out. Striping across mirrors is a nice way to aggregate
the space for good speed and availability.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
