References: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
	<b227ce32-6612-7604-477d-70f2b46a9543@redhat.com>
From: Ondrej Kozina <okozina@redhat.com>
Message-ID: <f92838ba-1f59-5489-3c26-13cb64ee0b06@redhat.com>
Date: Mon, 10 Sep 2018 18:09:16 +0200
MIME-Version: 1.0
In-Reply-To: <b227ce32-6612-7604-477d-70f2b46a9543@redhat.com>
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Prepend LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Oleksandr Panchuk <panolex@gmail.com>, Zdenek Kabelac <zkabelac@redhat.com>

On 09/03/2018 04:52 PM, Zdenek Kabelac wrote:
> 
> I assume there is already some RFE to provide such support - in terms of
> existing limitation that you need to always prepend whole 'extent'  (so i.e.
> with 4MiB  extent size - you need to prepend at least 4MiB)

Here it goes: https://bugzilla.redhat.com/show_bug.cgi?id=1609189

Regards
O.
