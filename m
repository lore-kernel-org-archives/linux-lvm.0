From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Can't find LVM partition
Message-ID: <20020613191447.GK1038@tykepenguin.com>
References: <C394073E4521D411ABF10006293838D604CA574F@cmh0401mai01.amr.stercomm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <C394073E4521D411ABF10006293838D604CA574F@cmh0401mai01.amr.stercomm.com>
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
Date: Thu Jun 13 14:15:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jun 13, 2002 at 11:36:38AM -0400, Stauffer, Darryl wrote:
> Hello,
> 
> I just got done upgrading from Redhat 7.2 to Redhat 7.3.  My home directory
> was setup on its own partition using LVM and reiserFS.  The upgrade was done
> by formatting the original root partition and reinstalling OS which means
> that all the LVM info is gone.  Is there any way to recover my LVM
> partition?

If all that was upgraded was an existing non-LVM root partition then vgscan
should fine the LVM bits again without help. 

patrick
