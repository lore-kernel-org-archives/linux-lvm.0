Subject: Re: [linux-lvm] filter problem
Message-ID: <20020829133550.GA3244@fib011235813.fsnet.co.uk>
References: <200208281556.58230.wim@unetix.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200208281556.58230.wim@unetix.nl>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Aug 29 08:36:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Aug 28, 2002 at 03:56:58PM +0200, Wim Bakker wrote:
> Hello,
> 
> I am evaluating lvm2
> I use the following :
> LVM2.1.95.10  device-mapper.0.96.04 , kernel 2.4.19
> after installing everything I copied the example.conf
> to /etc/lvm/lvm.conf
> Everything works fine except one thing, the filtering on
> devices to scan
> the corresponding entry in my lvm.conf is:
> filter = ["a/sda/", "r/.*/"]
> this is so only the sda devices get scanned as explained in
> the man page. But it doesn't work , when I do a  "lvm vgscan"
> it scans all devices in the /dev directory, not very nice of
> lvm to not listen to its filter directives.

I think there's some confusion about what vgscan will be doing and
where the filters fit in.  Certainly I just had to look at the code to
remind myself:

vgscan will stat *every* device under the /dev tree (or elsewhere if
you've specified a different dev dir).

If the device is a block device it will then pass it through the
predicate functions/filters in the following order:

i.  Regex - is the device accepted by the regexs specified in lvm.conf?

ii.  LVM check - is this device a 'recognised' device type. eg, IDE,
md, loop etc.

iii. Is it a valid partition number.

iv.  Can I successfully open the device 
     *** This is the expensive operation for non existent devs ***

Personally I see no need for checks ii. and iii. they will probably
disappear.

So with your filter which accepts every device containing 'sda' you
will find that /dev/ide0 is 'stat'd but no more than this.  However
with /dev/sda8 (non existent) you will get as far as the open test
before being rejected.

Once vgscan has been run the tools will not even stat failed devices.

NOTE: You don't always need to run vgscan on startup with LVM2,
only if you know some devices have moved - I just run 'vgchange -ay' in
my init script.

- Joe
