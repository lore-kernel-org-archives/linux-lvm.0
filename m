From: Wim Bakker <wim@unetix.nl>
Subject: Re: [linux-lvm] filter problem
References: <200208281556.58230.wim@unetix.nl> <20020829133550.GA3244@fib011235813.fsnet.co.uk>
In-Reply-To: <20020829133550.GA3244@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200208301233.12859.wim@unetix.nl>
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
Date: Fri Aug 30 05:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thursday 29 August 2002 15:35, Joe Thornber wrote:

> I think there's some confusion about what vgscan will be doing and
> where the filters fit in.  Certainly I just had to look at the code to
> remind myself:
>
> vgscan will stat *every* device under the /dev tree (or elsewhere if
> you've specified a different dev dir).
>
> If the device is a block device it will then pass it through the
> predicate functions/filters in the following order:
>
> i.  Regex - is the device accepted by the regexs specified in lvm.conf?
>
> ii.  LVM check - is this device a 'recognised' device type. eg, IDE,
> md, loop etc.
>
> iii. Is it a valid partition number.
>
> iv.  Can I successfully open the device
>      *** This is the expensive operation for non existent devs ***
>
> Personally I see no need for checks ii. and iii. they will probably
> disappear.
>
> So with your filter which accepts every device containing 'sda' you
> will find that /dev/ide0 is 'stat'd but no more than this.  However
> with /dev/sda8 (non existent) you will get as far as the open test
> before being rejected.
>
> Once vgscan has been run the tools will not even stat failed devices.
>
> NOTE: You don't always need to run vgscan on startup with LVM2,
> only if you know some devices have moved - I just run 'vgchange -ay' in
> my init script.
>
> - Joe

Thanks for the explanation, it's clear now what's happening.

Wim Bakker
