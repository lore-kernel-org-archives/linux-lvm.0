Return-Path: <tandem@dnmi.no>
Subject: Re: [linux-lvm] LVM Questions
References: <20010503004851.897.qmail@web10803.mail.yahoo.com>
	<3AF0B857.74F16371@home.com> <wv4rv26hvj.fsf@freeze.oslo.dnmi.no>
	<20010504093350.D4700@sistina.com> <wvlmod7e23.fsf@freeze.oslo.dnmi.no>
	<20010504103827.A10758@sistina.com>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 04 May 2001 11:38:43 +0200
In-Reply-To: "Heinz J. Mauelshagen"'s message of "Fri, 4 May 2001 10:38:27 +0000"
Message-ID: <wvhez178t8.fsf@freeze.oslo.dnmi.no>
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

    >>  HP/UX, how unfortunate :-) Thanks for the info. though.

    Heinz> ;-)

    Heinz> Actually the HP/UX LVM and its CLI has some major
    Heinz> advantages over others:

    Heinz>  - it has a very simple layering (the PV, VG, LV thingies)
    Heinz> and therefore is very easy to understand

    Heinz>  - the CLI follows the layers transparently

    Heinz>  - CLI is "self explaining" in regard of having native
    Heinz> language postfixes in the command names like create,
    Heinz> extend, reduce, change etc.

    Heinz> In production this boils down to shorter learning cycles
    Heinz> for admin newbies and easier handling in regular production
    Heinz> -> less money spend!

Actually I thought that LVM had been modelled upon AIX's LVM when I
first started using it; the commands are very similar.

Actually, it gives me an idea for AIX compatiblity wrappers (possibly
something else for the TODO list if it hasn't filled up the LV
already, then again you can always lvextend it:-)

    Heinz> BTW: what's unfortunate IYO with the HP/UX LVM? :-)

Sorry, I meant HP/UX OS itself (not from personal experience but the
years of reading of non-standard HP/UX command, libraries, etc., then
again AIX has had it share of those).

<snip>

Anyway, thats to you and others who had a hand in LVM. It makes
using Linux as easy (on the FS side) as its been to use AIX for the
years I've admining it (almost 10 now).

Regards,

Adrian

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
