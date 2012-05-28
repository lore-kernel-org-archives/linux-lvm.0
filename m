Date: Mon, 28 May 2012 18:11:11 +0200 (CEST)
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <4FC39524.6010800@redhat.com>
Message-ID: <alpine.DEB.2.02.1205281802530.2644@shack.dolda2000.com>
References: <alpine.DEB.2.02.1205281619370.2644@shack.dolda2000.com>
	<4FC39524.6010800@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Isolation of volume groups
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 28 May 2012, Bryn M. Reeves wrote:
> On 05/28/2012 03:33 PM, Fredrik Tolf wrote:
>> Last night, one of the PVs in datvol had a transient SATA link
>> failure and popped in and out of existence for a little while,
>> which caused datvol and the LVs on it to fail. No permanent damage
>> seems to have occurred, though, so I'm not too worried about that.
>> I could bring datvol down and up again to make it work, so I guess
>> everything worked as should be expected.
>
> Are the devices for ravol and datvol on the same SATA bus or controller?

Well, it's a bit mixed. The PVs in datvol are spread over two SATA 
controllers, one of which also controls the ravol drives. However, the 
drive that failed was on the controller which is not used by ravol, and 
the actual PV in ravol (there's only one) is an MD volume (a RAID 1 
array), and MD itself never reported any errors.

--

Fredrik Tolf
