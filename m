From: "Ben Holness" <ben@bens-house.org.uk>
Subject: RE: [linux-lvm] pvcreate problems - can't find partition
Message-Id: <000001c18c68$47531840$0b00a8c0@homelan.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20011224085415.A13907@colombina.comedia.it>
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
Date: Mon Dec 24 04:43:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>> [root@firewall root]# pvcreate -v /dev/hda4
>> pvcreate -- locking logical volume manager
>> pvcreate -- checking physical volume name "/dev/hda4"
>> pvcreate -- getting physical volume size
>> pvcreate -- device "/dev/hda4" doesn't exist

> oh yeah,
> there is a problem in lvm when devfs is enabled
> it only sees devices with long devfs name
> try using:
> pvcreate -v /dev/ide/host0/bus0/target0/lun0/part4

Worked like a charm!

Many thanks,

Ben
