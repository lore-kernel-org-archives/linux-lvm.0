Sender: Paul Henson <paul.b.henson@gmail.com>
From: "Paul B. Henson" <henson@acm.org>
References: <0b4701cf3d86$4a25d8a0$de7189e0$@acm.org>
	<53201EF8.3020104@redhat.com>
In-Reply-To: <53201EF8.3020104@redhat.com>
Date: Wed, 12 Mar 2014 12:07:37 -0700
Message-ID: <0bf101cf3e26$57024680$0506d380$@acm.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Subject: Re: [linux-lvm] migrating a thick LV to a thin LV
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
To: 'Marian Csontos' <mcsontos@redhat.com>, 'LVM general discussion and development' <linux-lvm@redhat.com>

> From: Marian Csontos
> Sent: Wednesday, March 12, 2014 1:47 AM
>
> Yes, discarded blocks in the thin-pool data device which are not
> referenced from other thin-volumes (snapshots) are released regardless
> whether the device at the bottom supports discards or not.

Excellent; thanks for the confirmation.
