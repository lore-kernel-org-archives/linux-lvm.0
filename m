From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] LAZY MODE: non-LVM 2 LVM - Destroys data?
In-Reply-To: <871yitvgjb.fsf@papadoc.bayour.com>
Message-ID: <Pine.LNX.4.33.0111201036380.2520-100000@dragon.inside.ntisys.com>
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
Date: Tue Nov 20 09:33:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On 20 Nov 2001, Turbo Fredriksson wrote:
> Do I _have_ to copy all the info to a empty disk, then create the lv
> (pvcreate et al)?

  No, you could just blow away your existing non-LVM partition and lose all
your data.  ;-)  But if you would like to *keep* your data, the answer is
"Yes, you have to copy it all to another filesystem".

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
