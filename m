References: <178294ff-5cb8-5dbd-9475-0cafb8958547@mglug.de>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <99bb7380-2330-66ce-4192-bf110a1111fa@redhat.com>
Date: Mon, 11 Dec 2017 13:24:32 +0100
MIME-Version: 1.0
In-Reply-To: <178294ff-5cb8-5dbd-9475-0cafb8958547@mglug.de>
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvmdbusd failure(s) at ubuntu
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Oliver Rath <rath@mglug.de>

On 12/11/2017 02:53 AM, Oliver Rath wrote:
> Hi list,
> 
> Im playing around with the dbus-daemon, which shows me some strange
> behaviours:
> 
>    * lvmdbusd doesnt run with the message
>      # lvmdbusd
>      Traceback (most recent call last):
>        File "/sbin/lvmdbusd", line 13, in <module>
>          from lvmdbusd import main
>      ModuleNotFoundError: No module named 'lvmdbusd'
>      *but* the module seems to be installed:
>      # find /usr/lib/ -iname "lvmdbusd"
>      /usr/lib/python3.6/site-packages/lvmdbusd
>      /usr/lib/python3.5/site-packages/lvmdbusd

Hmmm, what does `/usr/bin/env python3` return?

I have fixed a bug usptream: lvmdbusd must use python 3 interpreter 
detected by configure script not the python3 found in $PATH.

> 
>      Btw, lvmdbusd seems not to be installed for python2

That's true, it is not. It is python3 only.

>    * lvmdbusd is a python-script, but the installer says "python is
>      deprecated, use dbus instead". Can I use the dbus-interface (Im
>      working on some examples in Rust for this) without the lvmdbusd?

It says "python bindings". It is those python2 and python3 bindings we 
plan to remove in future - it never worked really well, had problems 
with configuration - and lvmdbusd is the intended replacement.

D-Bus daemon is written in python(3). And it should not require python 
bindings (and actually neither the applib - I fixed that bogus error 
upstream.)

It may see and rewrite to a compiled language, if that happened to be a 
bottleneck.

> 
> Is lvm via dbus possibly out of date and not longer useable?

It should not be.

> 
> My system is ubuntu 17.10 with lvm2-git installed:
> 
> # lvdisplay --version
>    LVM version:     2.02.177(2)-git (2017-11-03)
>    Library version: 1.02.146-git (2017-11-03)
>    Driver version:  4.37.0
>    Configuration:   ./configure --enable-lvmetad --enable-lvmpolld
> --enable-dmfilemapd --enable-cmdlib --enable-applib
> --enable-dbus-service --enable-notify-dbus --enable-python2_bindings
> 
> TfH
> 
> Oliver
> 
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
