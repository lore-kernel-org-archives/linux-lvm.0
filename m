References: <cd9e1cf3-2680-ef50-8629-161215d467a0@mglug.de>
From: Marian Csontos <mcsontos@redhat.com>
Message-ID: <44b19799-a6c2-9b9d-8d6a-8e988ad9f2dd@redhat.com>
Date: Mon, 11 Dec 2017 14:00:35 +0100
MIME-Version: 1.0
In-Reply-To: <cd9e1cf3-2680-ef50-8629-161215d467a0@mglug.de>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] addendum [was: lvmdbusd failure(s) at ubuntu ]
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

On 12/11/2017 03:27 AM, Oliver Rath wrote:
> Hi list,
> 
> trying to compile lvm2 with these flags:
> 
> ./configure --enable-lvmetad --enable-lvmpolld --enable-dmfilemapd
> --enable-applib --enable-cmdlib --enable-dbus-service
> --enable-notify-dbus --enable-python3_bindings
> 
> make
> ..
> 
> make install
> ..
> warning: install_lib: 'build/lib.linux-x86_64-3.6' does not exist -- no
> Python modules to install

Oliver Rath -vv
	Try being more verbose, please.

Removing all context is not helpful at all.

make install for lvmdbusd should run py-compile script found in autoconf 
directory, which should write bytecode *.py[co] to that directory.

May be:

- it did not run,
- or it used different directory,
- or ...???

> 
> What does this mean?

No idea. Not very helpful answer, but if you post full output from 
`configure ...` and `make install`, you might get better one.

-- Martian

> 
> Tfh!
> 
> Oliver
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
