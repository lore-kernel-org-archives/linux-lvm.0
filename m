References: <0572fd11-c137-3def-cf63-3c796de07cf2@strike.wu.ac.at>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4372d8da-e5d8-fba9-dba8-aee7d8e763b4@redhat.com>
Date: Mon, 28 Jan 2019 11:07:28 +0100
MIME-Version: 1.0
In-Reply-To: <0572fd11-c137-3def-cf63-3c796de07cf2@strike.wu.ac.at>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvextend doesn't sync raid1 LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>

Dne 25. 01. 19 v 18:33 Alexander 'Leo' Bergolth napsal(a):
> Hi!
> 
> If I extend a raid1 LV using lvextend, the newly allocated space in the two rimage devices isn't synced, just like if I had used the option --nosync.
> 
> As a result, a following raid check will report mismatches.
> 

Hi

Please open  BZ  for lvm2 https://bugzilla.redhat.com/enter_bug.cgi
and submit all your findings there.

Regards

Zdenek
