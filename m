Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FC119BDD
	for <linux-lvm@lists.linux.dev>; Fri, 20 Oct 2023 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ns1yxTFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697837481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vxF7sspgs2FRq2Cg53zsqm0lNI/83AadyMAFhCF5YQY=;
	b=Ns1yxTFVxKF0lOWZc2GSu4Bc88utMb2YKfrU107LRJZ71pcMSjxEVuu6coNQpf3rzYHRpp
	qYZTCwl+7xEBOJ/k3aGE+zrJKn/xpTljCdtIGu7B7Xt+GgvS5Nrom6/pRR2YKBRt+L4UHz
	T/5wnuqbPRE9+2R+4XWWuH+sjaLKZ8I=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-KbhxRRVbNq2adsMCMNPAIw-1; Fri, 20 Oct 2023 17:31:14 -0400
X-MC-Unique: KbhxRRVbNq2adsMCMNPAIw-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41b83b3fd18so15502161cf.3
        for <linux-lvm@lists.linux.dev>; Fri, 20 Oct 2023 14:31:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697837473; x=1698442273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxF7sspgs2FRq2Cg53zsqm0lNI/83AadyMAFhCF5YQY=;
        b=geJ7X3wIT3jl9mZPCluHoyt0sOLlFRTGBudMQZvdc2CtsyP/SfxvIqyY5AheTtBlw4
         U0dCRcEfOVAP7mwzPnE6aMb8W+hLdbb9WAkdHbC91bBmAZaKYAnsQ1Ie53lU/oMvb3e7
         RwBJu0EKqMWnwvQ+Q52S8owdw2ogI6qzH/doEq9X0EEdX0aJotgQfazEmgGDMwJBwYI/
         QU95w/Qw4CD4n7AcNDU6loQWDcgy/sWY/F1sL9hlRYKkBE+Vax8m9YlzmFqUTsOoTqNP
         RSN6uWS/+u397r8I34VwjVgADPxlD3YzvJF1IFbN/h2j+Q7ImfoIFyPEQa9ZZC0XmcXg
         xxMg==
X-Gm-Message-State: AOJu0YwUolqZ9FUlI5kjkRuKtmRUJV41VkdZWFeAqW+8ivzMXVkI2+/t
	erysk5TI+PPB8rob2vI+U2WHjv07nzUQW7jdu3fTtn8hhmidfaaRmTQS5OHbnBGW0DM4iAEI72u
	JBQSV0usbB/bGKpiDUlZdRICPrgS3TnnNTBrzMT9x5x1OAccApiFDbWn4A6pfhsAmEAwL4tts9s
	no0h4=
X-Received: by 2002:ac8:4e86:0:b0:41b:826b:1be8 with SMTP id 6-20020ac84e86000000b0041b826b1be8mr3581785qtp.17.1697837473273;
        Fri, 20 Oct 2023 14:31:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVqhsDX0/WHq0IOlx+oh3wAmegpd5QVxdr/xjuwIdQeFDGZrVLn3CaJHN9yNq6hnnfvtUFnw==
X-Received: by 2002:ac8:4e86:0:b0:41b:826b:1be8 with SMTP id 6-20020ac84e86000000b0041b826b1be8mr3581772qtp.17.1697837473002;
        Fri, 20 Oct 2023 14:31:13 -0700 (PDT)
Received: from localhost (pool-68-160-141-91.bstnma.fios.verizon.net. [68.160.141.91])
        by smtp.gmail.com with ESMTPSA id a18-20020ac87212000000b00419b5274381sm879150qtp.94.2023.10.20.14.31.12
        for <linux-lvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 14:31:12 -0700 (PDT)
Date: Fri, 20 Oct 2023 17:31:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: linux-lvm@lists.linux.dev
Subject: linux-lvm has migrated to lists.linux.dev [was: Re: Welcome to the
 "linux-lvm" mailing list]
Message-ID: <ZTLxn6Ng5IRRAvYR@redhat.com>
References: <mailman.0.1697833421.3533607.linux-lvm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <mailman.0.1697833421.3533607.linux-lvm@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

[Sorry for the noise of the previous mailman email, please ignore it.]

As a linux-lvm@redhat.com subscriber, you have been silently subscribed
to the new mailing list: linux-lvm@lists.linux.dev.

Effective immediately, all linux-lvm email should be addressed to:
linux-lvm@lists.linux.dev

If you do send email to linux-lvm@redhat.com you will get this
auto-response:

  Your email to linux-lvm@redhat.com was delivered using
  linux-lvm@lists.linux.dev because: 
  As of 2023.10.20: linux-lvm@redhat.com has migrated to
  linux-lvm@lists.linux.dev

  Please update the linux-lvm address to linux-lvm@lists.linux.dev

  If you were a linux-lvm@redhat.com subscriber you have been silently
  subscribed to linux-lvm@lists.linux.dev

  Please be sure to update any linux-lvm mail filter you may have to look
  for this in mail headers:
  List-Id: <linux-lvm.lists.linux.dev>

  NOTE: If you, or a friend, were a linux-lvm@redhat.com subscriber
  with disabled mail delivery: then you must subscribe to
  linux-lvm@lists.linux.dev.  To do so please send email to:
  linux-lvm+subscribe@lists.linux.dev

  To unsubscribe from linux-lvm@lists.linux.dev please send email to:
  linux-lvm+unsubscribe@lists.linux.dev

The linux-lvm list archive is now here:
https://lore.kernel.org/linux-lvm/

Please let me know if you have any questions or concerns.

Thanks,
Mike

