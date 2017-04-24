References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<362fe87a-7396-d73f-0d9c-2bbd10f10f94@redhat.com>
	<2eaf73d7-cac8-2b3f-efae-c840685f8383@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4ac92f56-4fb4-8499-5c3e-fc8c2ed9806b@redhat.com>
Date: Mon, 24 Apr 2017 16:48:00 +0200
MIME-Version: 1.0
In-Reply-To: <2eaf73d7-cac8-2b3f-efae-c840685f8383@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 24.4.2017 v 15:49 Gionatan Danti napsal(a):
> 
> 
> On 22/04/2017 23:22, Zdenek Kabelac wrote:
>> ATM there is even bug for 169 & 170 - dmeventd should generate message
>> at 80,85,90,95,100 - but it does it only once - will be fixed soon...
> 
> Mmm... quite a bug, considering how important is monitoring. All things 
> considered, what do you feel is the better approach to monitor? It is 
> possibile to register for dmevents?

Not all that big once - you get 1 WARNING always.
And releases  169 & 170 are clearly marked as developer releases - so they are 
meant for testing and discovering these bugs...

>> Not seen metadata error for quite long time...
>> Since all the updates are CRC32 protected it's quite solid.
> 
> Great! Are the metadata writes somehow jounaled or are written in-place?

Surely there is journal


Zdenek
