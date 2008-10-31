Message-ID: <91b13c310810310341r230392e2ubb44334c66de52d2@mail.gmail.com>
Date: Fri, 31 Oct 2008 18:41:32 +0800
From: "rae l" <crquan@gmail.com>
Subject: Re: [linux-lvm] How to make lvm error handling robust?
In-Reply-To: <490ADD76.1060208@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <91b13c310810300015j25be4feeqdab86d28ecfb0866@mail.gmail.com>
	<49098ACA.9000409@redhat.com>
	<91b13c310810301947x6c268b7bp9df8d4376be72011@mail.gmail.com>
	<490ADD76.1060208@redhat.com>
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 31, 2008 at 6:27 PM, Bryn M. Reeves <bmr@redhat.com> wrote:
> As long as the devices aren't busy (mounted file systems or other
> devices mapped over them), you can remove these maps with "dmsetup
> remove". If the devices are busy then you are out of luck, but that's
> going to be the case regardless of whether you're using
> device-mapper/LVM or not.
dmsetup works well.

Thank you.

>
> Regards,
> Bryn.
