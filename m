Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25A9F60562
	for <linux-lvm@redhat.com>; Fri,  3 Nov 2017 08:19:17 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B85DC0587EC
	for <linux-lvm@redhat.com>; Fri,  3 Nov 2017 08:19:14 +0000 (UTC)
Received: from [192.168.0.4] (unknown [82.66.78.161])
	(Authenticated sender: georges.giralt)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1895D780333
	for <linux-lvm@redhat.com>; Fri,  3 Nov 2017 08:19:10 +0000 (UTC)
References: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
	<f099a6aefe6b25997971d1cbbed7dfeb@assyoma.it>
	<8c9d2725-d8f9-ca2c-1679-f1fdc9570373@free.fr>
	<66180b6e-37f9-11d9-50af-3ba38aef205e@gathman.org>
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <2a616f8b-17bd-b6f0-ff22-a220b02eefeb@free.fr>
Date: Fri, 3 Nov 2017 09:19:10 +0100
MIME-Version: 1.0
In-Reply-To: <66180b6e-37f9-11d9-50af-3ba38aef205e@gathman.org>
Content-Transfer-Encoding: 8bit
Content-Language: fr
Subject: Re: [linux-lvm] Question on mixing technologies
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
To: linux-lvm@redhat.com

Hello !

Here I'm again.

I've played a bit more with my setup.

I've changed two computers : a server having got a new mainboard with an 
M.2 plug, In it I installed a NVME SSD card.

On this machine, I created a PV onto this device and added this PV to 
the VG holding the system. I then did pvmove to place the lv containing 
/ and /usr to the SSD. Perfect !

The server is really highly responsive and, as the /var and /tmp are 
still on mechanical drives I hope the SSD will be long lived.

On my laptop, the SSD has been used for the / and /usr outside of LVM 
(the laptop had already a GPT disk and I decided not to use LVM at all).

I can't compare the behavior because of the huge difference between the 
two machines, but I'm really happy with both settings.

Thnks for your help.


Le 01/06/2017 � 02:31, Stuart Gathman a �crit�:
> On 05/31/2017 02:53 AM, Georges Giralt wrote:
>> I finally had time to test the first solution, having the root FS on
>> the M.2 card and everything else (including /var and /tmp) on the
>> mechanical drives.
>>
>> The responsiveness of the machine is awesome and, for now, without any
>> glitch or problem. So I may retain this solution.
>>
>> The only remaining question is how to trim the device as it is not
>> "mounted". Is there a special pvcreate or LVM option to have this
>> device trimmed when it should be ?
> # fstrim /
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
