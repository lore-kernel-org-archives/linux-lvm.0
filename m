Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] LVM Questions
References: <20010503004851.897.qmail@web10803.mail.yahoo.com>
	<3AF0B857.74F16371@home.com> <wv4rv26hvj.fsf@freeze.oslo.dnmi.no>
	<20010504093350.D4700@sistina.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 04 May 2001 09:45:24 +0200
In-Reply-To: "Heinz J. Mauelshagen"'s message of "Fri, 4 May 2001 09:33:50 +0000"
Message-ID: <wvlmod7e23.fsf@freeze.oslo.dnmi.no>
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

>>>>> "Heinz" == Heinz J Mauelshagen <Mauelshagen@sistina.com> writes:

<snip>
    >>  I believe it is officially supported, ie. if it breaks then
    >> its a bug, and have done it now several times, at least on
    >> lightly loaded filesystems. Its not quite as convienient as
    >> AIX's LVM, in that one resizes the filesystem and the logical
    >> volume is automatically resized, but if I'm bothered I'll write
    >> a wrapper script around lvextend/lvreduce for that.
    >> 
    >> A question for the developers if they notice. Why lvextend and
    >> lvreduce, as they do the same things. Is it just for clarity ?
    >> A lvresize with + or - or a fixed size to could the same ?

    Heinz> The Linux LVM CLI is as close as possible to the HP/UX one
    Heinz> which has those commands (and vgextend/vgreduce as well)
    Heinz> seperate.  This makes at least me as a long term HP/UX LVM
    Heinz> user happy ;-)

HP/UX, how unfortunate :-) Thanks for the info. though.

    Heinz> lvresize can easily be made as a convenence wrapper
    Heinz> though...

Patches accepted I presume :-)

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
