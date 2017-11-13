Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 319D282E24
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2017 15:13:02 +0000 (UTC)
Received: from strike.wu.ac.at (strike.wu-wien.ac.at [137.208.89.120])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99C6A6868F
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2017 15:12:59 +0000 (UTC)
References: <6cfeccb2-b3f6-dbd0-f5b8-b5e79a25baf8@strike.wu.ac.at>
	<bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
From: "Alexander 'Leo' Bergolth" <leo@strike.wu.ac.at>
Message-ID: <3450079e-1251-792f-c4c2-982f309b41b5@strike.wu.ac.at>
Date: Mon, 13 Nov 2017 16:12:57 +0100
MIME-Version: 1.0
In-Reply-To: <bb7da243-13bd-cb2c-1e83-258a463af38d@redhat.com>
Content-Language: de-AT
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM hangs
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
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi!

On 11/13/2017 03:51 PM, Zdenek Kabelac wrote:
> Dne 13.11.2017 v 14:41 Alexander 'Leo' Bergolth napsal(a):
>> I have a EL7 desktop box with two sata harddisks and two ssds in a
>> LVM raid1 - thin pool - cache configuration. (Just migrated to this
>> setup a few weeks ago.)
>>
>> After some days, individual processes start to block in disk wait.
>> I don't know if the problem resides in the cache-, thin- or raid1-layer
>> but the underlying block-devices are fully responsive.
>>
>> I have prepared some info at:
>> �� http://leo.kloburg.at/tmp/lvm-blocks/
>>
>> Do the stack backtraces provide enough information to locate the source
>> of the blocks?
>>
>> I'd be happy to provide additional info, if necessary.
>> Meanwhile I'll disable the LVM cache layer to eliminate this potential
>> candidate.
> 
> It would be probably nice to see the result of 'dmsetup status'


OK. Will be included next time.


> I'd have guessed you are probably hitting� 'frozen' raid state
> which is unfortunate existing upstream bug.

Are you talking about RH bug 1388632?
https://bugzilla.redhat.com/show_bug.cgi?id=1388632

Unfortunately I can only view the google-cached version of the bugzilla
page, since the bug is restricted to internal view only.

But the google-cached version suggests that the bug is mainly hit when
removing the raid-backed cache pool under IO.

I my scenario, no modification (like cache removal) of the lvm setup was
done when the blocks occured.

Cheers,
--leo
-- 
e-mail   ::: Leo.Bergolth (at) wu.ac.at
fax      ::: +43-1-31336-906050
location ::: IT-Services | Vienna University of Economics | Austria
