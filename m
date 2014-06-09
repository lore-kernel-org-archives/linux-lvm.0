Message-ID: <5395CAE1.2030106@mooluv.com>
Date: Mon, 09 Jun 2014 10:55:29 -0400
From: Leeman Strout <me@mooluv.com>
MIME-Version: 1.0
References: <53924E22.60403@mooluv.com> <53958348.3000501@redhat.com>
	<539587BA.3040500@redhat.com>
In-Reply-To: <539587BA.3040500@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm Bug? - bad reaction to snapshot creation
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
To: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 06/09/2014 06:08 AM, Marian Csontos wrote:
>
> There is also a recent BZ against RHEL7:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=1105732
>
> What are the devices used in the stack?

It's all there in the original message,

> hardware: Supermicro X9DR3-F,
> onboard SATA controller:
> 00:1f.2 SATA controller: Intel Corporation C600/X79 series chipset 6-Port SATA AHCI Controller (rev 06)
> /dev/md0 consists of 2 Seagate 600 240GB SSDs on that controller
> /dev/ssd.vg consists of /dev/md0

If that is not sufficient, what exactly are you looking for?


Thanks,
Leeman
