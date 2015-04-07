Date: Tue, 7 Apr 2015 22:04:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20150407210454.GB32694@agk-dp.fab.redhat.com>
References: <1428440042-13679-1-git-send-email-tasleson@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1428440042-13679-1-git-send-email-tasleson@redhat.com>
Subject: Re: [linux-lvm] [PATCH 1/2] python: Make lv
	addTag/removeTag	persistant
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
To: Tony Asleson <tasleson@redhat.com>
Cc: linux-lvm@redhat.com

On Tue, Apr 07, 2015 at 03:54:01PM -0500, Tony Asleson wrote:
> +    if (lvm_vg_write(self->parent_vgobj->vg) == -1)

In the end, you may need to make this configurable for the library user
(consistently over all functions).
Some users will want to set lots of properties on lots of LVs followed
by a single atomic commit for them all; whereas other users will want to
commit each change independently.

Alasdair
