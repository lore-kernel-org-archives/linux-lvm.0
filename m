Date: Fri, 7 Jun 2019 11:13:04 -0600
From: Jonathan Corbet <corbet@lwn.net>
Message-ID: <20190607111304.767fb038@lwn.net>
In-Reply-To: <20190604182719.15944-1-helen.koike@collabora.com>
References: <20190604182719.15944-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] [PATCH] Documentation/dm-init: fix multi device
	example
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
To: Helen Koike <helen.koike@collabora.com>
Cc: wad@chromium.org, keescook@chromium.org, snitzer@redhat.com, linux-doc@vger.kernel.org, richard.weinberger@gmail.com, linux-kernel@vger.kernel.org, swboyd@chromium.org, dm-devel@redhat.com, linux-lvm@redhat.com, enric.balletbo@collabora.com, kernel@collabora.com, agk@redhat.com

On Tue,  4 Jun 2019 15:27:19 -0300
Helen Koike <helen.koike@collabora.com> wrote:

> The example in the docs regarding multiple device-mappers is invalid (it
> has a wrong number of arguments), it's a left over from previous
> versions of the patch.
> Replace the example with an valid and tested one.
> 
> Signed-off-by: Helen Koike <helen.koike@collabora.com>

Applied, thanks.

jon
