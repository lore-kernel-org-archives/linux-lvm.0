Message-ID: <512A2DC3.6040503@barfooze.de>
Date: Sun, 24 Feb 2013 16:12:03 +0100
From: John Spencer <maillist-lvm@barfooze.de>
MIME-Version: 1.0
References: <51082839.5080400@barfooze.de>	<20130130025520.GB868@agk-dp.fab.redhat.com>
	<5109E597.5040706@barfooze.de>
In-Reply-To: <5109E597.5040706@barfooze.de>
Content-Type: multipart/mixed; boundary="------------070206090409070605060707"
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
To: zkabelac@redhat.com
Cc: agk@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------070206090409070605060707
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/31/2013 04:31 AM, John Spencer wrote:
> On 01/30/2013 03:55 AM, Alasdair G Kergon wrote:
>> On Tue, Jan 29, 2013 at 08:51:21PM +0100, John Spencer wrote:
>>> may i ask kindly to reformulate that statement so that it works with
>>> posix sed (as used in busybox 1.20.2) ?
>>
>> I'm perfectly happy using modern extensions to these tools:)
>>
>> If you want this to work with alternative versions, please send a tested
>> patch for us to incorporate. (Either modifications to the commands so
>> it works with both or else alternative versions which configure chooses
>> between.)
>
> a couple of regex experts looked at it, and the reason it didnt work is
> simply a bug: the \ before d is wrong. apparently the author meant to
> escape the makefile variable that follows, but that is not necessary and
> so the backslash gets passed on.
>
> find attached a patch that works correctly with gnu sed and busybox sed.


zdenek, since alasdair does not seem to react, would you mind applying 
this patch for a quick test, see that it generates both linker scripts 
(.export.sym) correctly (exactly the same output than before) and merge 
it ? thanks!

(reattaching the patch)

thanks,
--JS

--------------070206090409070605060707
Content-Type: text/x-patch;
	name="0001-make.tmpl.in-fix-buggy-sed-statement-that-worked-by-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename*0="0001-make.tmpl.in-fix-buggy-sed-statement-that-worked-by-.pa";
	filename*1="tch"


--------------070206090409070605060707--
