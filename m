References: <f45ed20a-6773-54c2-d1f6-774522f1d7f8@mglug.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7766d2aa-e80b-1f28-9b3d-233861ffe9fd@redhat.com>
Date: Wed, 9 May 2018 10:27:55 +0200
MIME-Version: 1.0
In-Reply-To: <f45ed20a-6773-54c2-d1f6-774522f1d7f8@mglug.de>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] api recommandation (example_cmdlib.c doesnt work
	properly)?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Oliver Rath <rath@mglug.de>

Dne 9.5.2018 v 08:52 Oliver Rath napsal(a):
> Hi list,
> 
> i tried to get some lvm-commands working using example_cmdlib.c
> (modified, attached). Unfortunatly the example hangs trying a "lvcreate
> --name test --size 12M levg" command:

Hi

Please avoid tweaking code to use  cmdlib - it's  internal library and
lvm2 is highly recommending to always FORK  lvm2 command - instead
of trying to embeded it in your application.

There are numerous memory requirements during certain operation that would be 
pretty bad to be imposed for other users tool.

If you want to 'stream' multiple commands - you could pipe  lvm shell to 
minimize forking, however than error reporting & reaction becomes a bit harder 
to play with.

> 
> Whats wrong here? Ist there a better api for communicating from other
> programs?

It's simply not official API and it's based on internal knowledge and uses 
settings from lvm.conf - these settings are tied to use of lvm command.

> 
> Imho the python support is deprecated, lvm2app is deprecated, dbus-api
> is limited at the moment (right? Didnt find documentation for it), so
> the only way seems liblvm or call explicit the lvm-tools.


dBus API is somewhat 'frozen' as there is no active development on this part,
and would be nice to get someone involved into this more...


Regards


Zdenek
