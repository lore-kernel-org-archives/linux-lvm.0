From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Multiple snapshots do weird things?
Message-ID: <20030910105632.A10869@uk.sistina.com>
References: <3F5E9A43.5010202@gbrmpa.gov.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F5E9A43.5010202@gbrmpa.gov.au>; from glen@gbrmpa.gov.au on Wed, Sep 10, 2003 at 01:28:03PM +1000
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
Date: Wed Sep 10 04:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 10, 2003 at 01:28:03PM +1000, Glen Harris wrote:
>  From a few notes here and there, I've been under the impression that
> multiple snapshots of a single LV are possible. The problem is that
> whenever I try to take more than two, everything falls apart.

Firstly, can you post the output of 'lvm version' and confirm that 
your device-mapper driver version is version 4.0.4 ?
  e.g. 4.0.4-ioctl (2003-08-30)

Alasdair
-- 
agk@uk.sistina.com
