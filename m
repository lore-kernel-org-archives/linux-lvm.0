Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1NKbXi10478
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 15:37:33 -0500
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20040223203731.GA14731@reti>
References: <20040223163106.GA22231@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040223163106.GA22231@cistron.nl>
Subject: [linux-lvm] Re: dm, dm_table, request_queue
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Feb 23 15:36:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel van Smoorenburg <miquels@cistron.nl>
Cc: linux-lvm@sistina.com, thornber@redhat.com

On Mon, Feb 23, 2004 at 05:31:08PM +0100, Miquel van Smoorenburg wrote:
> And, in general, do you feel this is the correct solution ?

No, I'm going to do what Jens Axboe suggested and add a congestion
function into the request_queue itself.  dm will therefore provide its
own congestion function that takes the targets into account.  I think
this is the opposite of what you're suggesting, devices look downwards
to their children devices rather than up to their parents.

- Joe
