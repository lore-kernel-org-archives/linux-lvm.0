From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <1031830000.1041621627@[192.168.200.4]>
In-Reply-To: <1041620373.20036.52.camel@mosix>
References: <1041610095.19844.45.camel@mosix>
 	<20030103174618.Z9539@zealot.blacknet.de>
 <1041613503.20036.49.camel@mosix>	 <20030103170356.GH18613@tykepenguin.com>
 <1041620373.20036.52.camel@mosix>
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
Date: Fri Jan  3 13:12:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Matt Schillinger <mschilli@vss.fsi.com>

> Patrick,
>
> I was wondering if you could explain a little bit of how lvm finds a
> device that no longer corresponds to the same 'dev/sd*' name. does it
> use some kind of device id or serial number? I just want to be doubly
> sure, as Steven Lembark claimed that it WOULDN't work..

LVM is going to look for, say, /dev/sda1. If the device
at that location in your disk chain is not a PV then you
will have problems. The "sda1" string say to access the
first scsi drive that was put on line. Depending on
controller issues you may get into situations where the
SCSI initiators come on line in a random order and you
have no way of knowing what "sda1" really means. The
fix there is to install one of them as a module and only
bring on line the controller with your boot drive on it
at first.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 8773 252 1080
