Date: Thu, 20 Apr 2017 11:04:32 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170420160432.GB29033@redhat.com>
References: <CAB-bdyR1cNqWzbvFxXqb1+HRcK7Kq0y5Jafj+yJXBdcutrbb0A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB-bdyR1cNqWzbvFxXqb1+HRcK7Kq0y5Jafj+yJXBdcutrbb0A@mail.gmail.com>
Subject: Re: [linux-lvm] new multipath device mistakenly replaced another PV
 in existing volume group
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neutron Sharc <neutronsharc@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Apr 19, 2017 at 02:53:19PM -0700, Neutron Sharc wrote:
> Please note that all these vol3_[0-3] are fresh, without any LVM
> metadata on them, as shown by pvscan::
> sudo pvscan --cache /dev/mapper/vol3_0
>   Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
>   Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096
>   Incorrect metadata area header checksum on /dev/mapper/vol3_0 at offset 4096

That error indicates there is LVM metadata on them.

>   Found duplicate PV 9F6vU9NVBfEq1w3e04T5UreO6fDVPJNy: using
> /dev/mapper/vol1_3 not /dev/mapper/vol3_0

That error indicates it's the same LVM metadata on them.

Perhaps you're exporting the same data source on the back end via separate
devices, or have copied the data sources, or are using snapshots of them.

Dave
