From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] lvm2 cvs build error
Message-ID: <20030501125908.A13132@uk.sistina.com>
References: <20030430235909.5ea1d398.wilreichert@yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030430235909.5ea1d398.wilreichert@yahoo.com>; from wilreichert@yahoo.com on Wed, Apr 30, 2003 at 11:59:09PM -0400
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu May  1 06:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 30, 2003 at 11:59:09PM -0400, Wil Reichert wrote:
> Someone forget to add mirror.c?

You should never assume the head of CVS will be in a consistent
state or safe to use.  The code is undergoing active development:
If you want to experiment running it, you'll need to work around 
any compilation errors yourself, or try checking out earlier
versions (e.g. using labels or -D).

Alasdair
-- 
agk@uk.sistina.com
