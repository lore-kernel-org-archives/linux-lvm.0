Message-ID: <5109E597.5040706@barfooze.de>
Date: Thu, 31 Jan 2013 04:31:35 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
References: <51082839.5080400@barfooze.de>
	<20130130025520.GB868@agk-dp.fab.redhat.com>
In-Reply-To: <20130130025520.GB868@agk-dp.fab.redhat.com>
Content-Type: multipart/mixed; boundary="------------080503000901040808090509"
Subject: Re: [linux-lvm] lvm2 portability issues (GNU sed is assumed)
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
To: linux-lvm@redhat.com
Cc: agk@redhat.com

This is a multi-part message in MIME format.
--------------080503000901040808090509
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/30/2013 03:55 AM, Alasdair G Kergon wrote:
> On Tue, Jan 29, 2013 at 08:51:21PM +0100, John Spencer wrote:
>> may i ask kindly to reformulate that statement so that it works with
>> posix sed (as used in busybox 1.20.2) ?
>
> I'm perfectly happy using modern extensions to these tools:)
>
> If you want this to work with alternative versions, please send a tested
> patch for us to incorporate.  (Either modifications to the commands so
> it works with both or else alternative versions which configure chooses
> between.)

a couple of regex experts looked at it, and the reason it didnt work is 
simply a bug: the \ before d is wrong. apparently the author meant to 
escape the makefile variable that follows, but that is not necessary and 
so the backslash gets passed on.

find attached a patch that works correctly with gnu sed and busybox sed.

btw: apparently there are 2 other bugs in that sed statement:
| should become \| to work as intended by the author (gnu sed only), and 
[ \*] should become [ *].
but apparently this part of the regex isn't used anyway, so it might be 
the best to just remove it.
i left that part unfixed, as it is not crucial, so someone else might 
want to look at it.

thanks,
--JS

>
> Alasdair
>
>


--------------080503000901040808090509
Content-Type: text/x-patch;
	name="0001-make.tmpl.in-fix-buggy-sed-statement-that-worked-by-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-make.tmpl.in-fix-buggy-sed-statement-that-worked-by-.pa";
	filename*1="tch"


--------------080503000901040808090509--
