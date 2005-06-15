Date: Wed, 15 Jun 2005 21:08:29 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Does LVM2 support mirrored volumes
Message-ID: <20050615200829.GX4195@agk.surrey.redhat.com>
References: <B06940B80A03814CAB09CDC85B9A987B21AED2@zctfhxm0.corp.nortel.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B06940B80A03814CAB09CDC85B9A987B21AED2@zctfhxm0.corp.nortel.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: "Gameiro, Philippe" <Philippe.Gameiro@windriver.com>, Rachid Koucha <koucha@nortel.com>, "Giorgi,
	Alexandra" <Alexandra.Giorgi@windriver.com>

On Wed, Jun 15, 2005 at 12:31:38PM -0400, David Plainfosse wrote:
> y	Turns on mirror write consistency which insures data consistency
> among mirrored copies of a logical volume during normal I/O processing.

That comes as default with device-mapper - there's no option to turn it off.
 
> I have read in archived emails that the lvcreate  -m1 option enables
> mirrored copies but it is not officially
> supported. Do you know if a particular LVM2 release support mirrored volumes
> ?

Work is progressing on this - some limited mirror features are available 
in 2.01.12:
  Can create new volumes as mirrors, and remove them when not active.
  lvchange -an doesn't work properly yet and must be followed with some 
  dmsetup remove.  Device failure is not handled.  Power cut / reset button 
  is handled OK, keeping the mirror images in sync with each other.

Alasdair
-- 
agk@redhat.com
