Message-ID: <3BC44C95.50101@st-peter.stw.uni-erlangen.de>
Date: Wed, 10 Oct 2001 15:26:45 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Downgrading
References: <000001c15181$7c3b32d0$836788cf@industry>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

>
>
>As I have recently discovered, there isn't yet an official patch for
>EXT3 on 2.4.10.  If that is the case, I suppose I should downgrade in
>
why dont you try -ac kernel, they have ext3 integrated
so go vor a 2.4.10-ac10 + lvm-1.0.1-rc4 and it should be pretty stable
