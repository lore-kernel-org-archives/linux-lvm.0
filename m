From: Paul Jakma <paulj@alphyra.ie>
Subject: Re: [linux-lvm] ext2online fails
In-Reply-To: <20011129095307.F29249@lynx.no>
Message-ID: <Pine.LNX.4.33.0112131616390.2286-100000@dunlop.dub.ie.alphyra.com>
MIME-Version: 1.0
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
Date: Thu Dec 13 10:18:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: "Jonathan S. Polacheck" <JPolache@texasmutual.com>

On Thu, 29 Nov 2001, Andreas Dilger wrote:

> "ext2resize /dev/vg1/vol_usr" which will detect the size of the LV and
> resize the filesystem to fill it.

surely for an LVM user it'd be more advisable to use 'e2fsadm' so as 
to ensure the resizing of the LV and ext2/3 fs are done with regard to 
each other (and without user intervention.)? or does ext2resize now 
also resize the LV as neccessary?

> Cheers, Andreas

--paulj
