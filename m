Date: Thu, 17 May 2018 10:07:01 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20180517090700.wq46lti6zek6tns2@reti>
References: <20180516201903.24309-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20180516201903.24309-1-alex.bennee@linaro.org>
Subject: Re: [linux-lvm] [PATCH] lib/device/bcache: don't use PAGE_SIZE
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>

Thanks.  Merged.

On Wed, May 16, 2018 at 09:19:03PM +0100, Alex Benn=EF=BF=BDe wrote:
> PAGE_SIZE is not a compile time constant. Use sysconf instead like
> elsewhere in the code.
