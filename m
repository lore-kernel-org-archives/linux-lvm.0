From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Can no longer mount lvm striped volume
Message-Id: <20020502193610.GA810@tykepenguin.com>
References: <20020502121825.B3956@hpti.com>
    <Pine.SGI.4.33.0205021333290.5694922-100000@erc2000.erc.wisc.edu>
    <20020502130722.E4053@hpti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020502130722.E4053@hpti.com>
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
Date: Thu May  2 14:34:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 02, 2002 at 01:07:22PM -0600, Craig Tierney wrote:
> Things are getting better.  I found 2 of the
> 3 lv's that were missing.  I am trying to find the last
> one.  

Try vgscan -f, it will replace all the LV numbers with new ones rather than try
to preserve them.

-- 

patrick
