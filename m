Return-Path: <andy@redeye.com>
Subject: Re: [linux-lvm] the curious case of the semi-created Logical Volume
References: <m21ytase6y.fsf_-_@andy.off.redeye.com> <20010208093123.B529@tykepenguin.com> <m2lmrhecgj.fsf@andy.off.redeye.com> <20010208100648.C529@tykepenguin.com> <m24ry5e9m9.fsf@andy.off.redeye.com> <20010208143606.A31256@tykepenguin.com>
From: Andy Cowling <andy@redeye.com>
Date: 08 Feb 2001 15:29:14 +0000
In-Reply-To: Patrick Caulfield's message of "Thu, 8 Feb 2001 14:36:06 +0000"
Message-ID: <m2ae7xchx1.fsf@andy.off.redeye.com>
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

>>>>> "Patrick" == Patrick Caulfield <caulfield@sistina.com> writes:

    Patrick> What version of LVM are you running ? That output doesn't
    Patrick> match either my 0.8final or 0.9 systems !

It came bundled with SuSE 7.0...

# lvdisplay -?                  
Logical Volume Manager 0.8 by Heinz Mauelshagen  04/11/1999 (IOP 6)

# uname -a
Linux h2o 2.2.16-SMP #1 SMP Wed Aug 2 20:01:21 GMT 2000 i686 unknown

I tried to build 0.9 and got the following error (presumably because
the 2.2.16 kernel is not supported)

# ./lvdisplay -v -D /dev/pv01/lv01
lvdisplay -- invalid i/o protocol version 6

I tried to build 0.8final but am missing
               /usr/src/linux/include/linux/lvm.h
