Message-ID: <52034F2A.1000608@redhat.com>
Date: Thu, 08 Aug 2013 09:56:26 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CAGDaZ_pgnZeWHrGO3_fQK92AQnoApGuf2Lq6rGNEGngf9p=UrA@mail.gmail.com>
	<52034E72.7050403@redhat.com>
In-Reply-To: <52034E72.7050403@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Weird errors after fresh install
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Raymond Jennings <shentino@gmail.com>

On 08/08/2013 09:53 AM, Peter Rajnoha wrote:
> We've nailed this down to a problem with gcc
> compiler and its optimisation. It happens if -O2 optimisation is used
> during compilation, but it does not happen with -O1 nor -O0. Also, we
> could not reproduce with gcc 4.7, but reproduced with 4.8.

...also, it happens on 32-bit arch, and we did not reproduce on 64-bit.
What architecture are you using and what gcc version is used on your
distro? Can you confirm?

Peter
