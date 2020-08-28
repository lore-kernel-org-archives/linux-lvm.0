Date: Fri, 28 Aug 2020 13:26:08 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20200828182608.GA17233@redhat.com>
References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Zhao Heming <heming.zhao@suse.com>, linux-lvm@redhat.com

On Fri, Aug 28, 2020 at 06:04:44PM +0200, Zdenek Kabelac wrote:
> LV 'available' has one simple meaning - LV is present in DM table.
> Status is either available or NOT available.

LV Status can also be "suspended", so there's already some variation in
that field (which is why these free-form lvdisplay fields should be
avoided.)  But I agree, it's probably best to leave lvdisplay alone for
historical purposes and add anything new using just lvs fields.

Zhao, I think we should revert that commit, and come up with a new word to
describe this thing (which also needs a clear definition), and report it
in lvs.

Dave
